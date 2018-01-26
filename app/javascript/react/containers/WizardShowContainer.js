import React, { Component } from 'react';

import WizardShow from '../components/WizardShow';

class WizardShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      wizard: {},
      reviews: []
    }
  }

  componentDidMount() {
    let wizardId = this.props.params.id;
    fetch(`/api/v1/wizards/${wizardId}`)
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
      this.setState({ wizard: body.wizard, reviews: body.reviews })
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    return(
      <div>
        <WizardShow
          name={this.state.wizard.name}
          id={this.state.wizard.id}
          description={this.state.wizard.description}
          imgUrl={this.state.wizard.img_url}
          rating={this.state.wizard.rating}
          reviews={this.state.reviews}
        />

      </div>
    )
  }
}

export default WizardShowContainer;
