import { NtosWindow } from '../layouts';
import { PowerMonitorContent } from './PowerMonitor';

<<<<<<< HEAD
export const NtosPowerMonitor = () => {
=======
export const NtosPowerMonitor = (props, context) => {
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
  return (
    <NtosWindow width={550} height={700}>
      <NtosWindow.Content scrollable>
        <PowerMonitorContent />
      </NtosWindow.Content>
    </NtosWindow>
  );
};
