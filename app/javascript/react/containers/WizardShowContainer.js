import React, { Component } from 'react';

import WizardShow from '../components/WizardShow';
import ReviewTile from '../components/ReviewTile'

class WizardShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      wizard: {},
      reviews: []
    }
  }

  componentDidMount() {

    let wizardId = this.props.params.name;
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
      debugger
      this.setState({ wizard: body.wizard, reviews: body.reviews })
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    let reviewArray = this.state.reviews.map((review) => {
      return(
        <ReviewTile
          key={review.id}
        />
      )
    })
    return(
      <div>
        <WizardShow
          name={this.state.wizard.name}
          id={this.state.wizard.id}
          description={this.state.wizard.description}
          imgUrl={this.state.wizard.img_url}
          rating={this.state.wizard.rating}
        />
        {reviewArray}
      </div>
    )
  }
}

export default WizardShowContainer;
