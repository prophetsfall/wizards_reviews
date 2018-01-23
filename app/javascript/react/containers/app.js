import React, { Component } from 'react';
// import { Router, browserHistory, Route, IndexRoute } from 'react-router';
//
import WizardsContainer from './WizardsContainer'

class App extends Component {
  constructor(props){
    super(props)
    this.state = {

    }
  }
  render(){
    return(
      <div>
        <WizardsContainer />
      </div>
    )
  }
}
export default App