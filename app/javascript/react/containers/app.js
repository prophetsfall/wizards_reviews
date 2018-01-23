import React from 'react';
import { Router, browserHistory, Route, IndexRoute } from 'react-router';
import NavBar from '../components/NavBar'

import WizardsContainer from './WizardsContainer'

const App = props => {


  return(
    <Router history={browserHistory}>
      <Route path='/' component={NavBar} >
        <IndexRoute component={WizardsContainer} />
      </Route>
      <WizardsContainer />
    </Router>
  )
}
export default App
