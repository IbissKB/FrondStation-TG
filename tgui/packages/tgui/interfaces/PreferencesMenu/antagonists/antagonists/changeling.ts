import { Antagonist, Category } from '../base';
import { multiline } from 'common/string';

<<<<<<< HEAD
=======
export const CHANGELING_MECHANICAL_DESCRIPTION = multiline`
Transform yourself or others into different identities, and buy from an
arsenal of biological weaponry with the DNA you collect.
`;

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
const Changeling: Antagonist = {
  key: 'changeling',
  name: 'Changeling',
  description: [
    multiline`
      A highly intelligent alien predator that is capable of altering their
      shape to flawlessly resemble a human.
    `,
<<<<<<< HEAD

    multiline`
      Transform yourself or others into different identities, and buy from an
      arsenal of biological weaponry with the DNA you collect.
    `,
=======
    CHANGELING_MECHANICAL_DESCRIPTION,
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
  ],
  category: Category.Roundstart,
};

export default Changeling;
