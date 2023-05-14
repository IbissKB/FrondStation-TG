<<<<<<< HEAD
import { Feature, FeatureColorInput, FeatureDropdownInput, FeatureShortTextInput } from '../base';

export const pda_color: Feature<string> = {
  name: 'PDA color',
  category: 'GAMEPLAY',
  description: 'The background color of your PDA.',
  component: FeatureColorInput,
};

export const pda_style: Feature<string> = {
  name: 'PDA style',
  category: 'GAMEPLAY',
  description: 'The style of your equipped PDA. Changes font.',
=======
import { Feature, FeatureChoiced, FeatureDropdownInput, FeatureShortTextInput } from '../base';

export const pda_theme: FeatureChoiced = {
  name: 'PDA Theme',
  category: 'GAMEPLAY',
  description: 'The theme of your PDA.',
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
  component: FeatureDropdownInput,
};

export const pda_ringtone: Feature<string> = {
  name: 'PDA Ringtone',
  description: "The ringtone you'll hear when someone sends you a PDA message.",
  component: FeatureShortTextInput,
};
