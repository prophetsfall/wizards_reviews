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
      reviews: [],
      fetchMethod: "post",
      apiPath: "/api/v1/reviews"
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
    if (this.state.wizard.user_reviews) {
      if (this.state.wizard.user_reviews.length>0) {
        this.setState({fetchMethod: "patch", apiPath:"/api/v1/review"})
      }
    }
    fetch(`${this.state.apiPath}/${this.state.wizard.user_reviews[0].id}`, {
      credentials: 'same-origin',
      method: `${this.state.fetchMethod}`,
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
    let reviewForm;
    if (this.state.wizard.user_reviews) {
      if (this.state.wizard.user_reviews.length>0) {

        reviewForm = (
          <ReviewFormContainer
            addNewReview={this.addNewReview}
            wizardId={this.state.wizard_id}
            body={this.state.wizard.user_reviews[0].body}
            rating={this.state.wizard.user_reviews[0].rating}
          />
          )
        } else {
          reviewForm = (
            <ReviewFormContainer
              addNewReview={this.addNewReview}
              wizardId={this.state.wizard.id}
            />
          )
        }
      } else {
        reviewForm= <p></p>
      }

    return(
      <div>
        <WizardShow
          name={this.state.wizard.name}
          id={this.state.wizard.id}
          description={this.state.wizard.description}
          imgUrl={this.state.wizard.image_path}
          rating={this.state.wizard.rating}
          creator_id={this.state.wizard.creator_id}
          user_id={this.state.user.id}
        />
        {reviewArray}
        {reviewForm}
      </div>
    )
  }
}

export default WizardShowContainer;
