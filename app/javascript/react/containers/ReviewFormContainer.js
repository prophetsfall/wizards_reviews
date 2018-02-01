import React, { Component } from 'react';

import ReviewForm from '../components/ReviewForm'

class ReviewFormContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      bodyText: this.props.body,
      rating: this.props.rating
    }
    this.reviewChange = this.reviewChange.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
    this.ratingChange = this.ratingChange.bind(this)
    this.handleDelete = this.handleDelete.bind(this)
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
    let formPayload = {
      review: {
        body: this.state.bodyText,
        rating: this.state.rating,
        wizard_id: this.props.wizardId,
        review_id: this.props.reviewId
    } }
    this.props.addNewReview(formPayload)
    this.setState({bodyText:"", rating:""})
  }

  handleDelete(event){
    let formPayload = {
    review: {
      body: this.state.bodyText,
      rating: this.state.rating,
      wizard_id: this.props.wizardId,
      review_id: this.props.reviewId
  } }
  this.props.deleteReview(formPayload)
  this.setState({bodyText:"", rating:""})
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
          passDownDelete={this.handleDelete}
        />

      </div>
    )
  }
}

export default ReviewFormContainer;
