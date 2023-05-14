/**
 * @file
 * @copyright 2020 Aleksej Komarov
 * @license MIT
 */

import { createAction } from 'common/redux';
<<<<<<< HEAD
=======
import { createHighlightSetting } from './model';
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

export const updateSettings = createAction('settings/update');
export const loadSettings = createAction('settings/load');
export const changeSettingsTab = createAction('settings/changeTab');
export const toggleSettings = createAction('settings/toggle');
export const openChatSettings = createAction('settings/openChatTab');
<<<<<<< HEAD
=======
export const addHighlightSetting = createAction(
  'settings/addHighlightSetting',
  () => ({
    payload: createHighlightSetting(),
  })
);
export const removeHighlightSetting = createAction(
  'settings/removeHighlightSetting'
);
export const updateHighlightSetting = createAction(
  'settings/updateHighlightSetting'
);
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
