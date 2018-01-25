import React from 'react';
import { Router, browserHistory, Route, IndexRoute } from 'react-router';
import NavBar from '../components/NavBar'
import WizardShowContainer from './WizardShowContainer'
import WizardsContainer from './WizardsContainer'
import WizardTile from '../components/WizardTile'
import WizardsForm from '../components/WizardsForm'

const App = props => {


  return(
    <Router history={browserHistory}>
      <Route path='/' component={NavBar} >
        <IndexRoute component={WizardsContainer} />
        <Route path="/wizards/new" component={WizardsForm}/>
        <Route path='/wizards/:name' component={WizardShowContainer}/>
      </Route>
    </Router>
  )
}
export default App
