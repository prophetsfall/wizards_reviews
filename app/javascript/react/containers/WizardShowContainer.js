import React, { Component } from 'react';

import WizardShow from '../components/WizardShow';
import ReviewTile from '../components/ReviewTile'
import ReviewFormContainer from './ReviewFormContainer'

class WizardShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      wizard: {},
      reviews: []
    }
    this.addNewReview = this.addNewReview.bind(this)
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
      this.setState({ wizard: body.wizard, reviews: body.wizard.reviews })
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }


  addNewReview(formPayload) {

    fetch('/api/v1/reviews', {
      credentials: 'same-origin',
      method: 'post',
      body: JSON.stringify(formPayload),
      headers: {
        'Content-Type': 'application/json',
        'X-Requested-With': 'XMLHttpRequest',

      }
    })
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
      let newReviewsArray = this.state.reviews.concat(body.review)
      this.setState({ reviews: newReviewsArray })
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {

    let reviewArray = this.state.wizard.reviews.map((review) => {
      return(
        <ReviewTile
          key={review.id}
          body={review.body}
          rating={review.rating}
          userId={review.user_id}
        />
      )
    })
    let csrfToken = $('meta[name=csrf-token]').attr('content')
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
        {reviewArray}
        <ReviewFormContainer
          addNewReview={this.addNewReview}
          wizardId={this.state.wizard.id}
          token={csrfToken}
        />
      </div>
    )
  }
}

export default WizardShowContainer;
