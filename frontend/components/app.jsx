import React from 'react';
import {Route} from 'react-router-dom';

import SplashContainer from './splash/splash_container';
import LoginFormContainer from './session/login_form_container';
import SignupFormContainer from './session/signup_form_container';
import {AuthRoute, ProtectedRoute} from '../utils/route_util';
import MainContainer from './main/main_container';
import Invite from './invite/invite';

const App = () => (
  <div id='app'>
    <Route exact path='/' component={SplashContainer}/>
    <AuthRoute path='/login' component={LoginFormContainer}/>
    <AuthRoute path='/register' component={SignupFormContainer}/>
    <ProtectedRoute path='/channels/:guildId' component={MainContainer}/>
    <ProtectedRoute path='/join/:invite' component={Invite}/>
  </div>
);

export default App;