<<<<<<< HEAD
import { FeatureColorInput, Feature, FeatureChoiced, FeatureDropdownInput } from './base';
=======
import { FeatureColorInput, Feature, FeatureChoiced, FeatureDropdownInput, FeatureValueProps, FeatureChoicedServerData } from './base';
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

export const eye_color: Feature<string> = {
  name: 'Eye color',
  component: FeatureColorInput,
};

export const facial_hair_color: Feature<string> = {
  name: 'Facial hair color',
  component: FeatureColorInput,
};

export const facial_hair_gradient: FeatureChoiced = {
  name: 'Facial hair gradient',
<<<<<<< HEAD
  component: FeatureDropdownInput,
=======
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
};

export const facial_hair_gradient_color: Feature<string> = {
  name: 'Facial hair gradient color',
  component: FeatureColorInput,
};

export const hair_color: Feature<string> = {
  name: 'Hair color',
  component: FeatureColorInput,
};

export const hair_gradient: FeatureChoiced = {
  name: 'Hair gradient',
<<<<<<< HEAD
  component: FeatureDropdownInput,
=======
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
};

export const hair_gradient_color: Feature<string> = {
  name: 'Hair gradient color',
  component: FeatureColorInput,
};

export const feature_human_ears: FeatureChoiced = {
  name: 'Ears',
<<<<<<< HEAD
  component: FeatureDropdownInput,
=======
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
};

export const feature_human_tail: FeatureChoiced = {
  name: 'Tail',
<<<<<<< HEAD
  component: FeatureDropdownInput,
=======
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
};

export const feature_lizard_legs: FeatureChoiced = {
  name: 'Legs',
<<<<<<< HEAD
  component: FeatureDropdownInput,
=======
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
};

export const feature_lizard_spines: FeatureChoiced = {
  name: 'Spines',
<<<<<<< HEAD
  component: FeatureDropdownInput,
=======
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
};

export const feature_lizard_tail: FeatureChoiced = {
  name: 'Tail',
<<<<<<< HEAD
  component: FeatureDropdownInput,
=======
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
};

export const feature_mcolor: Feature<string> = {
  name: 'Mutant color',
  component: FeatureColorInput,
};

export const underwear_color: Feature<string> = {
  name: 'Underwear color',
  component: FeatureColorInput,
};

export const feature_vampire_status: Feature<string> = {
  name: 'Vampire status',
  component: FeatureDropdownInput,
};

export const heterochromatic: Feature<string> = {
  name: 'Heterochromatic (Right Eye) color',
  component: FeatureColorInput,
};
