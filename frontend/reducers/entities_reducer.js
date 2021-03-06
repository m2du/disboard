import { combineReducers } from 'redux';
import UsersReducer from './users_reducer';
import GuildsReducer from './guilds_reducer';
import MembershipsReducer from './memberships_reducer';
import ChannelsReducer from './channels_reducer';
import MessagesReducer from './messages_reducer';
import DMsReducer from './dms_reducer';

export default combineReducers({
  users: UsersReducer,
  guilds: GuildsReducer,
  memberships: MembershipsReducer,
  channels: ChannelsReducer,
  messages: MessagesReducer,
  dms: DMsReducer
});