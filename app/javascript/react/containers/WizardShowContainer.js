import React, { Component } from 'react';

import WizardShow from '../components/WizardShow';
import ReviewTile from '../components/ReviewTile'
import ReviewFormContainer from './ReviewFormContainer'

class WizardShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      user: {},
      wizard: {},
      reviews: []
    }
    this.addNewReview = this.addNewReview.bind(this)
  }

  componentDidMount() {
    let wizardId = this.props.params.id;
    fetch(`/api/v1/wizards/${wizardId}`, {credentials: 'same-origin'})
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
      this.setState({ user: body.wizard.user, wizard: body.wizard, reviews: body.wizard.reviews })
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
        'X-CSRF-Token': $('meta[name=csrf-token]').attr('content')
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
    let reviewArray = this.state.reviews.map((review) => {
      return(
        <ReviewTile
          key={review.id}
          body={review.body}
          rating={review.rating}
          userName={review.creator_name}
        />
      )
    })

    return(
      <div>
        <WizardShow
          name={this.state.wizard.name}
          id={this.state.wizard.id}
          description={this.state.wizard.description}
          imgUrl={this.state.wizard.image_path}
          rating={this.state.wizard.rating}
          reviews={this.state.reviews}
          creator_id={this.state.wizard.creator_id}
          user_id={this.state.user.id}
        />
        {reviewArray}
        <ReviewFormContainer
          addNewReview={this.addNewReview}
          wizardId={this.state.wizard.id}
        />
      </div>
    )
  }
}

export default WizardShowContainer;
