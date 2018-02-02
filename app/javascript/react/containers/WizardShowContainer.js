import React, { Component } from 'react';

import WizardShow from '../components/WizardShow';
import ReviewTile from '../components/ReviewTile'
import ReviewFormContainer from './ReviewFormContainer'

class WizardShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      user_id: 0,
      wizard: {},
      reviews: [],
      school: null,
      averageRating: "X"
     }

    this.addNewReview = this.addNewReview.bind(this)
    this.getReviews = this.getReviews.bind(this)
    this.deleteReview = this.deleteReview.bind(this)
    this.alterVote = this.alterVote.bind(this)
  }
  getReviews() {
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
      let user_id
      if(body.wizard.user){
        user_id = body.wizard.user.id
      } else {
        user_id = 0
      }
      this.setState({ user_id: user_id, wizard: body.wizard, reviews: body.wizard.reviews})
      if (body.wizard.average_rating == "No Reviews") {
        this.setState({ averageRating: "X"})
      } else {
        this.setState({ averageRating: body.wizard.average_rating})
      }


    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  componentDidMount() {
    this.getReviews()

  }

  addNewReview(formPayload) {
    debugger
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
    .then( this.getReviews())
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  deleteReview(formPayload) {
    fetch(`/api/v1/reviews/${formPayload.review.review_id}`, {
      credentials: 'same-origin',
      method: 'delete',
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
    .then( this.getReviews())
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  alterVote(formPayload) {
    fetch('/api/v1/votes', {
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
      let alteredReviews
      alteredReviews = this.state.reviews.map((review) => {
        if (review.id === body.review.id){
          review.vote_count = body.review.vote_count
        }
        return(review)
      })
      this.setState({ reviews: alteredReviews })
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    let reviewArray = this.state.reviews.map((review) => {
      let voted = 0;
      if (review.user_votes.length === 1) {
        voted = review.user_votes[0].vote;
      }
      return(
        <ReviewTile
          key={review.id}
          id={review.id}
          body={review.body}
          rating={review.rating}
          userName={review.creator_name}
          votes={review.vote_count}
          alterVote={this.alterVote}
          voted={voted}
        />
      )
    })
    let reviewForm;
    let reviewId
    if (this.state.wizard.user_reviews) {
      if (this.state.wizard.user_reviews.length>0) {
        reviewId = this.state.wizard.user_reviews[0].id
        reviewForm = (
          <ReviewFormContainer
            addNewReview={this.addNewReview}
            wizardId={this.state.wizard.id}
            body={this.state.wizard.user_reviews[0].body}
            rating={this.state.wizard.user_reviews[0].rating}
            reviewId={reviewId}
            creatorId={this.state.wizard.user_reviews[0].user_id}
            userId={this.state.user_id}
            deleteReview={this.deleteReview}

          />
          )
        } else {
          reviewForm = (
            <ReviewFormContainer
              addNewReview={this.addNewReview}
              wizardId={this.state.wizard.id}
              rating={5}
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
          rating={this.state.averageRating}
          creator_id={this.state.wizard.creator_id}
          user_id={this.state.user_id}
          school={this.state.school}
        />
        <div id='reviewscheck'>
          <div>
            <br/>
            <br/>
            <br/>
            <br/>
            <br/>
          </div>
        {reviewArray}
        </div>
        {reviewForm}

      </div>
    )
  }
}

export default WizardShowContainer;
