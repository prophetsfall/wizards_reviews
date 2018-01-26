import React, { Component } from 'react';

import ReviewForm from '../components/ReviewForm'

class ReviewFormContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      bodyText: "",
      rating: ""
    }
    this.reviewChange = this.reviewChange.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
    this.ratingChange = this.ratingChange.bind(this)
  }

  ratingChange(value) {
    this.setState({ rating: value })
  }

  handleSubmit() {
    let formPayload = {
      review: {
        body: this.state.bodyText,
        rating: this.state.rating,
        user_id: 1,  // this is a temporary hardcorde for testing puroposes, change to: props.userId,
        wizard_id: this.props.wizardId
    } }
    this.props.addNewReview(formPayload)
  }

  reviewChange(value) {
    this.setState({ bodyText: value })
  }

  render() {
    let passDownReviewChange = (value) => { this.reviewChange(value) }
    let passDownSubmit = () => { this.handleSubmit() }
    let passDownRatingChange = (value) => { this.ratingChange(value) }

    return(
      <div>
        <ReviewForm
          bodyText={this.state.bodyText}
          rating={this.state.rating}
          passDownReviewChange={passDownReviewChange}
          passDownSubmit={passDownSubmit}
          passDownRatingChange={passDownRatingChange}
        />

      </div>
    )
  }
}

export default ReviewFormContainer;
