import { Widget } from 'astal/gtk4';
import Tray from 'gi://AstalTray';
import Apps from 'gi://AstalApps';
import { bind } from 'astal'

import { Icons } from '@/utils';

const tray = Tray.get_default();
const apps = new Apps.Apps();

export default () => {
  const { Box, Label, Button, Image } = Widget;
  const trayButtons = bind(tray, 'items').as(items =>
    items.map((item) => {
      const app = apps.fuzzy_query(item.get_title())[0];
      const iconName = app.get_icon_name();
      return <Button
        onClicked={() => item.activate(2, 2)}
        tooltip_text={item.get_title()}
        cssName='BarTray_item'
      >
        { iconName !== null ? <Image iconName={iconName}/> : <Label label={Icons.application}/> }
      </Button>;
    }));

  return <Box cssName='BarTray'>{trayButtons}</Box>;
}
