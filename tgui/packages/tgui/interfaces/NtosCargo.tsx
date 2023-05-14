import { CargoContent } from './Cargo.js';
import { NtosWindow } from '../layouts';

<<<<<<< HEAD
export const NtosCargo = () => {
=======
export const NtosCargo = (props, context) => {
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
  return (
    <NtosWindow width={800} height={500}>
      <NtosWindow.Content scrollable>
        <CargoContent />
      </NtosWindow.Content>
    </NtosWindow>
  );
};
