import { BountyBoardContent } from './BountyBoard';
import { NtosWindow } from '../layouts';

<<<<<<< HEAD
export const NtosBountyBoard = () => {
=======
export const NtosBountyBoard = (props, context) => {
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
  return (
    <NtosWindow width={550} height={600}>
      <NtosWindow.Content scrollable>
        <BountyBoardContent />
      </NtosWindow.Content>
    </NtosWindow>
  );
};
