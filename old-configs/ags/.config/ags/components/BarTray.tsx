import { Widget, Gtk } from 'astal/gtk4';
import Tray from 'gi://AstalTray';
import { bind } from 'astal'

const TrayItem = (item: Tray.TrayItem) => {
  const { MenuButton, Image, Popover } = Widget;

  const popover = Gtk.PopoverMenu.new_from_model(item.menu_model);
  popover.insert_action_group('dbusmenu', item.actionGroup)

  return <MenuButton
    tooltip_text={item.tooltip_markup}
    cssName='BarTray_item'
    hasFrame={false}
    canShrink={true}
    primary={true}
    popover={popover}
  >
    <Image
      gicon={item.gicon}
      cssName='BarTray_item_icon'
    />
  </MenuButton>;
};

export default () => {
  const tray = Tray.get_default();

  const { Box } = Widget;
  const trayItems = bind(tray, 'items');

  return <Box cssName='BarTray'>
    { trayItems.as(trayItems => trayItems.map(TrayItem))}
  </Box>;
}
