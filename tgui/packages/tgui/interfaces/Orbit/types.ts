<<<<<<< HEAD
export type Antags = Array<Observable & { antag: string }>;

export type AntagGroup = [string, Antags];

export type OrbitData = {
  alive: Observable[];
  antagonists: Antags;
  dead: Observable[];
=======
export type Antagonist = Observable & { antag: string; antag_group: string };

export type AntagGroup = [string, Antagonist[]];

export type OrbitData = {
  alive: Observable[];
  antagonists: Antagonist[];
  dead: Observable[];
  deadchat_controlled: Observable[];
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
  ghosts: Observable[];
  misc: Observable[];
  npcs: Observable[];
};

export type Observable = {
  extra?: string;
  full_name: string;
  health?: number;
  job?: string;
<<<<<<< HEAD
  job_icon?: string;
=======
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
  name?: string;
  orbiters?: number;
  ref: string;
};
