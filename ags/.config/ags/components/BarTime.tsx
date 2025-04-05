import { Widget } from 'astal/gtk4'
import { Variable } from 'astal'
import { Icons } from '@/utils';

export default () => {
  const { Box, Label } = Widget;
  const time = Variable('')
    .poll(1000, ['date', '+%H:%M:%S']);
  const onDestroy = () => {
    time.drop();
  };

  return <Box
    cssName='BarTime'
    onDestroy={onDestroy}
  >
    <Label
      cssName='BarTime_icon'
      label={Icons.time}
    />  
    <Label
      cssName='BarTime_time'
      label={time()}
    />
  </Box>;
}
