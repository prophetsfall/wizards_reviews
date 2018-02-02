import React from 'react';

const ReviewTile = props => {
  let body = props.body
  let rating = props.rating
  let created_at = props.created_at
  let votes = props.votes
  let handleClick = (event) => {
    let clicked = event.currentTarget
    let formPayload;
    if (clicked.className === 'upvote') {
      formPayload = {
        vote: {
          vote: 1,
          review_id: props.id
        }
      }
    } else if (clicked.className === 'downvote') {
      formPayload = {
        vote: {
          vote: -1,
          review_id: props.id
        }
      }
    }
    props.alterVote(formPayload)
  }

  return(
    <div id="scrolled">
      <p> {body}</p>
      <p id="ratingChange"> {rating/20}</p>
      <div>
        <a className="downvote" onClick={handleClick}>
          <i className="fas fa-arrow-down" ></i>
        </a> {votes} <a className="upvote" onClick={handleClick}>
          <i className="fas fa-arrow-up" ></i>
        </a>
      </div>
    </div>
  )
}
export default ReviewTile;
