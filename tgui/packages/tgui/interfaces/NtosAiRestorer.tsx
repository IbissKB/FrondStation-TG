import { NtosWindow } from '../layouts';
import { AiRestorerContent } from './AiRestorer';

<<<<<<< HEAD
export const NtosAiRestorer = () => {
=======
export const NtosAiRestorer = (props, context) => {
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
  return (
    <NtosWindow width={370} height={400}>
      <NtosWindow.Content scrollable>
        <AiRestorerContent />
      </NtosWindow.Content>
    </NtosWindow>
  );
};
