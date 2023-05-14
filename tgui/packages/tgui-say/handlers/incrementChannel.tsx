import { CHANNELS } from '../constants';
import { Modal } from '../types';

<<<<<<< HEAD
=======
// Insert the names of channels you want to not cycle on tab here
const BLACKLIST = ['Admin'];
const BLACKLISTED_CHANNEL_INDICES = CHANNELS.map((channel, index) => {
  if (BLACKLIST.includes(channel)) {
    return index;
  }
}).filter((x) => x !== undefined);

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
/**
 * Increments the channel or resets to the beginning of the list.
 * If the user switches between IC/OOC, messages Byond to toggle thinking
 * indicators.
 */
export const handleIncrementChannel = function (this: Modal) {
<<<<<<< HEAD
  const { channel } = this.state;
=======
  let { channel } = this.state;
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
  const { radioPrefix } = this.fields;
  if (radioPrefix === ':b ') {
    this.timers.channelDebounce({ mode: true });
  }
  this.fields.radioPrefix = '';
<<<<<<< HEAD
  if (channel === CHANNELS.length - 1) {
    this.timers.channelDebounce({ mode: true });
    this.setState({
      buttonContent: CHANNELS[0],
      channel: 0,
    });
  } else {
    if (channel === 2) {
      // Disables thinking indicator for OOC channel
      this.timers.channelDebounce({ mode: false });
    }
    this.setState({
      buttonContent: CHANNELS[channel + 1],
      channel: channel + 1,
    });
  }
=======
  if (BLACKLISTED_CHANNEL_INDICES.includes(channel)) {
    return;
  }
  if (BLACKLISTED_CHANNEL_INDICES.length === CHANNELS.length) {
    this.setState({
      buttonContent: CHANNELS[channel],
      channel,
    });
    return;
  }
  do {
    channel++;
    if (channel === CHANNELS.length) {
      this.timers.channelDebounce({ mode: true });
      channel = 0;
    }
  } while (BLACKLISTED_CHANNEL_INDICES.includes(channel));
  if (channel === CHANNELS.indexOf('OOC')) {
    // Disables thinking indicator for OOC channel
    this.timers.channelDebounce({ mode: false });
  }
  this.setState({
    buttonContent: CHANNELS[channel],
    channel,
  });
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
};
