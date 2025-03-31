import { App, Astal, Gdk, Gtk, Widget } from 'astal/gtk4';

import BarTime from '@/components/BarTime';
import BarTray from '@/components/BarTray';

export default (gdkmonitor: Gdk.Monitor) => {
  const { BOTTOM, LEFT, RIGHT } = Astal.WindowAnchor;
  const {
    Window,
    CenterBox,
    Box,
  } = Widget;

  return <Window
    visible
    cssName='Bar'
    gdkmonitor={gdkmonitor}
    exclusivity={Astal.Exclusivity.EXCLUSIVE}
    anchor={BOTTOM | LEFT | RIGHT}
    application={App}
    layer={Astal.Layer.BOTTOM}
  >
    <CenterBox
      cssName='Bar_inner'
      hexpand
      start_widget={
        <Box
          cssName='Bar_left'
          halign={Gtk.Align.START}
        >
          Left
        </Box>
      }
      center_widget={
        <Box
          cssName='Bar_center'
          halign={Gtk.Align.CENTER}
        >
          Center
        </Box>
      }
      end_widget={
        <Box
          cssName='Bar_right'
          halign={Gtk.Align.END}
        >
          <BarTime/>
          <BarTray/>
        </Box>
      }
    />
  </Window>;
}
