import { Widget } from 'astal/gtk4'
import { Variable } from 'astal'
import { Icons } from '@/utils';

export default () => {
  const { Box, Label } = Widget;
  const mem = Variable({
    ramTotal: 0,
    ramUsed: 0,
    ramUsedPercent: 0,
    swapTotal: 0,
    swapUsed: 0,
    swapUsedPercent: 0,
  }).poll(2000, 'free', out => {
    const lines = out.split('\n');
    const ramLine = lines.find(line => line.startsWith('Mem:')) ?? '';
    const swapLine = lines.find(line => line.startsWith('Swap:')) ?? '';
    const ramValues = ramLine.split(/\s+/);
    const swapValues = swapLine.split(/\s+/);
    const ramTotal = parseInt(ramValues[1]);
    const ramUsed = parseInt(ramValues[2]);
    const ramUsedPercent = (ramUsed/ramTotal) * 100;
    const swapTotal = parseInt(swapValues[1]);
    const swapUsed = parseInt(swapValues[2]);
    const swapUsedPercent = (swapUsed/swapTotal) * 100;

    return {
      ramTotal,
      ramUsed,
      ramUsedPercent,
      swapTotal,
      swapUsed,
      swapUsedPercent,
    };
  });

  const onDestroy = () => {
    mem.drop();
  };

  return <Box cssName='BarMem'>
    <Label
      cssName='BarMem_icon'
      label={Icons.ramMemory}
    />  
    <Label
      cssName='BarMem_memory'
      label={mem(({ ramUsedPercent }) => `${ramUsedPercent.toFixed(0)}%`)}
    />
  </Box>;
}
