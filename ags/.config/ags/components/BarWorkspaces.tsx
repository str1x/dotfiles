import { Widget, Gdk, Gtk } from 'astal/gtk4'
import Hyprland from 'gi://AstalHyprland';
import { bind, Variable, type Binding } from 'astal'
import { Icons } from '@/utils';

const hyprland = Hyprland.get_default();

type Workspace = {
  id: number
  name: string
  isSpecial: boolean
  isActive: boolean
}

const WorkspaceItem = (props: Binding<Workspace>) => {
  const { Label, Box } = Widget;
  const classes = props.as(({ isSpecial, isActive }) => [
    isActive ? 'active': 'inactive',
    isSpecial ? 'special' : 'normal',
  ]);
  const label = props.as(({ name }) => name);

  return <Box
    cssName='BarWorkspaces_workspace'
    cssClasses={classes}
    overflow={Gtk.Overflow.HIDDEN}
  >
    <Label
      width_request={20}
      cssName='BarWorkspaces_label'
      label={label}
    />
  </Box>
}

export default (props: { monitor: Gdk.Monitor }) => {
  const { Box } = Widget;

  const monitor = hyprland.monitors
    .find(({ name }) => props.monitor.connector === name)
    ?? hyprland.monitors[0];

  const activeInfo = Variable.derive([
    bind(monitor, 'activeWorkspace'),
    bind(monitor, 'specialWorkspace'),
  ], (activeWorkspace, specialWorkspace) => ({
    wsId: activeWorkspace.id,
    specialWsId: specialWorkspace?.id ?? 0,
  }));

  const workspaces = bind(hyprland, 'workspaces').as(wss => wss
    .map(ws =>
      activeInfo(activeInfo => {
        // bug with null ws on fast switching
        const isSpecial = ws.name?.startsWith('special:') ?? false;
        const name = isSpecial
          ? Icons.workspaces[ws?.name as keyof typeof Icons.workspaces] || (ws.name ?? '')
          : ws?.name ?? '';
        const isActive = isSpecial
          ? ws.id === activeInfo.specialWsId
          : ws.id === activeInfo.wsId;

        return {
          id: ws.id,
          name,
          isSpecial,
          isActive,
        }
      }),
    ),
  );

  const onDestroy = () => {
    activeInfo.drop();
  };

  return <Box
    cssName='BarWorkspaces'
    onDestroy={onDestroy}
    overflow={Gtk.Overflow.HIDDEN}
  >
    {
      workspaces.as(wss => {
        const specialWss = wss
          .filter(ws => ws.get().isSpecial)
          .sort((a, b) => a.get().id - b.get().id)
        if (specialWss.length === 0) return;
        return <Box cssName='BarWorkspaces_special'>
          { specialWss.map(WorkspaceItem)} 
        </Box>
      })
    }
    {
      workspaces.as(wss => {
        const normalWss = wss
          .filter((ws) => !ws.get().isSpecial)
          .sort((a, b) => a.get().id - b.get().id)
        if (normalWss.length === 0) return;
        return <Box cssName='BarWorkspaces_normal'>
          { normalWss.map(WorkspaceItem)} 
        </Box>
      })
    }
  </Box>;
}
