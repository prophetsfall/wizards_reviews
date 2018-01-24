import React from 'react';
import { Router, browserHistory, Route, IndexRoute } from 'react-router';
import NavBar from '../components/NavBar'
import WizardShowContainer from './WizardShowContainer'
import WizardsContainer from './WizardsContainer'

const App = props => {


  return(
    <Router history={browserHistory}>
      <Route path='/' component={NavBar} >
        <IndexRoute component={WizardsContainer} />

      </Route>
      <Route path='/wizards/:id' component={WizardShowContainer}/>
      <WizardsContainer />
    </Router>
  )
}
export default App
