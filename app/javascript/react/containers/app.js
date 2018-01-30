import React from 'react';
import { Router, browserHistory, Route, IndexRoute } from 'react-router';
import NavBar from '../components/NavBar'
import WizardShowContainer from './WizardShowContainer'
import WizardsContainer from './WizardsContainer'
import WizardTile from '../components/WizardTile'

const App = props => {

  return(
    <Router history={browserHistory}>
      <Route path='/' component={NavBar} >
        <IndexRoute component={WizardsContainer} />
          <Route path='/wizards' component={WizardsContainer} />
          <Route path='/wizards/:id' component={WizardShowContainer}/>
      </Route>
      <WizardsContainer />
    </Router>
  )
}
export default App
