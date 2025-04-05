import { Widget } from 'astal/gtk4'
import { Variable } from 'astal'
import { Icons } from '@/utils';

const command = "top -bn 2 -d 0.01 | grep '^%Cpu' | tail -n 1 | gawk '{print $2+$4+$6}'";

export default () => {
  const { Box, Label } = Widget;
  const cpu = Variable(0).poll(2000, ['sh', '-c', command], out => parseInt(out));

  const onDestroy = () => {
    cpu.drop();
  };

  return <Box cssName='BarCpu'>
    <Label
      cssName='BarCpu_icon'
      label={Icons.cpu}
    />  
    <Label
      cssName='BarCpu_value'
      label={cpu(usage => `${usage.toFixed(0)}%`)}
    />
  </Box>;
}
