import React, { Component } from 'react';

import WizardTile from '../components/WizardTile';


class WizardsContainer extends Component {
  constructor(props){
    super(props);
    this.state= {
      wizards: []
    }
  }
  componentDidMount() {
    fetch('/api/v1/wizards')
    .then(response => {
      if (response.ok) {
        return response;
      } else {
        let errorMessage = `${response.status} (${response.statusText})`,
            error = new Error(errorMessage);
        throw(error);
      }
    })
    .then(response => response.json())
    .then(body => {

      this.setState({ wizards: body.wizards })
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render(){
     let wizardObjects = this.state.wizards.map((wizard) => {

       return(
         <WizardTile
           key={wizard.name}
           name={wizard.name}
           id={wizard.id}
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
