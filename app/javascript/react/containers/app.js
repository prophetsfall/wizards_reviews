import React from 'react';
import { Router, browserHistory, Route, IndexRoute } from 'react-router';
import NavBar from '../components/navbar';

import WizardsContainer from './WizardsContainer';
import WizardShow from './WizardShow'

const App = props => {


  return(
    <Router history={browserHistory}>
      <Route path='/' component={NavBar} >
        <IndexRoute component={WizardsContainer} />
        <Route path='/wizards/:name' component={WizardShow} />
      </Route>
    </Router>
  )
}
export default App
