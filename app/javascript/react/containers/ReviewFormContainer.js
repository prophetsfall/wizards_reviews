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

  ratingChange(event) {

    let value = event.target.value
    this.setState({ rating: value })
  }

  reviewChange(event) {
    let value = event.target.value
    this.setState({ bodyText: value })
  }

  handleSubmit(event) {
    event.preventDefault();
    let formPayload = {
      review: {
        body: this.state.bodyText,
        rating: this.state.rating,
        wizard_id: this.props.wizardId,
    } }
    this.props.addNewReview(formPayload)
  }


  render() {
    let passDownReviewChange = (event) => { this.reviewChange(event) }
    let passDownRatingChange = (event) => { this.ratingChange(event) }

    return(
      <div>
        <ReviewForm
          bodyText={this.state.bodyText}
          rating={this.state.rating}
          passDownReviewChange={passDownReviewChange}
          passDownRatingChange={passDownRatingChange}
          passDownSubmit={this.handleSubmit}
        />

      </div>
    )
  }
}

export default ReviewFormContainer;
