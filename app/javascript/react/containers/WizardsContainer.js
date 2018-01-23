import React, { Component } from 'react';
import Wizard from '../components/WizardComponent'


class WizardsContainer extends Component {
  constructor(props){
    super(props);
    this.state={
      wizards: [
        // {name: 'Ian', description: 'A description'},
      //   // {name: 'James', description: 'A description'}
      ]
    }
  }
  render(){
    let wizardObjects = this.state.wizards.map((wizard)=>{
      return(
        <Wizard
        key={wizard.name}
        name={wizard.name}
        description={wizard.description}
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
