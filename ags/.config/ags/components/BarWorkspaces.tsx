import { Widget, Gdk } from 'astal/gtk4'
import Hyprland from 'gi://AstalHyprland';
import { bind, Variable } from 'astal'
import { Icons } from '@/utils';

const hyprland = Hyprland.get_default();

export default (props: { monitor: Gdk.Monitor }) => {
  const { Box, Label } = Widget;

  const wss = bind(hyprland, 'workspaces').as((workspaces) =>
    workspaces.map(({ id, name }) => {
      const isSpecial = name.startsWith('special:');
      return {
        id,
        name: isSpecial
          ? Icons.workspaces[name as keyof typeof Icons.workspaces] || name
          : name,
        isSpecial: name.startsWith('special'),
      };
    })
    .sort(),
  );

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

  const workspaces = wss.as(wss => {
    return wss.map(ws => {
      const isActive = activeInfo(val => ws.isSpecial ? ws.id === val.specialWsId : ws.id === val.wsId);
      const classes = isActive.as(active => [
        active ? 'active': '',
        ws.isSpecial ? 'spetial' : '',
      ]);

      return <Label
        cssName='BarWorkspaces_workspace'
        cssClasses={classes}
        label={ws.name}
      />;
    });
  });

  const onDestroy = () => {
    activeInfo.drop();
  };

  return <Box
    cssName='BarWorkspaces'
    onDestroy={onDestroy}
    children={workspaces}
  />;
}
