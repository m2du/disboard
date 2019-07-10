import {RECEIVE_GUILD} from '../actions/guild_actions';
import {RECEIVE_CHANNEL} from '../actions/channel_actions';

const channelsReducer = (state = {}, action) => {
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_GUILD:
      return Object.assign({}, state, action.guild.channels);
    case RECEIVE_CHANNEL:
      return Object.assign({}, state, {[action.channel.id]: action.channel});
    default:
      return state;
  }
};

export default channelsReducer;