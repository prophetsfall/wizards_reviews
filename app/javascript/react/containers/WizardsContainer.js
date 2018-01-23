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
<<<<<<< HEAD
    fetch('api/v1/wizards')
    .then(response => {
      debugger;
      response.json()
    })
    .then(json => {
      this.setState({ wizards: 'test'})
=======
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
      this.setState({ wizards: body})
>>>>>>> origin/master
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
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
