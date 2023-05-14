import { createDropdownInput, Feature } from '../base';

export const multiz_performance: Feature<number> = {
  name: 'Multi-Z Detail',
  category: 'GAMEPLAY',
  description: 'How detailed multi-z is. Lower this to improve performance',
  component: createDropdownInput({
    [-1]: 'Standard',
<<<<<<< HEAD
=======
    2: 'High',
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
    1: 'Medium',
    0: 'Low',
  }),
};
