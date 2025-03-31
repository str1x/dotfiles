import { App, Astal, Gdk, Gtk, Widget } from 'astal/gtk4'
import { Variable } from 'astal'

const time = Variable('').poll(1000, ['date', '+%H:%M:%S']);

export default () => {
  const { Box, Label } = Widget;
  return <Box>
    <Label
      label={time()}
    />
  </Box>;
}
