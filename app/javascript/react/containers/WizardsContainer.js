import React, { Component } from 'react';
import Wizard from '../components/WizardComponent'


class WizardsContainer extends Component {
  constructor(props){
    super(props);
    this.state= {
      wizards: []
    }
  }
  componentDidMount() {
    fetch(`api/v1/index`)
    .then(response => response.json())
    .then(json => {
      this.setState({ wizards: json})
    })
  }

  render(){
     let wizardObjects = this.state.wizards.map((wizard) => {
       return(
         <Wizard
           key = {wizard.name}
           name = {wizard.name}
           description = {wizard.description}
         />
       )
    })
    return(
      <div>
        {wizardObjects}
      </div>
    )
  }
}

export default WizardsContainer
