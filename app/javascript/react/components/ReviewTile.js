import React from 'react';


const ReviewTile = props => {

  let body = props.body
  let rating = props.rating
  let created_at = props.created_at
  let votes = props.votes

  let handleClick = (event) => {
    let clicked = event.target.id
    let formPayload
    if (clicked === 'upvote'){
      formPayload = {
        vote: {
          vote: 1,
          review_id: props.id
        }
      }
    } else if (clicked === 'downvote') {
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
    <div>
      <p> {body}</p>
      <p> {rating}</p>
      <p><i id="downvote" className="fas fa-arrow-down" onClick={handleClick}>down</i> {votes} <i id="upvote" className="fas fa-arrow-up" onClick={handleClick}>up</i></p>
    </div>
  )
}
export default ReviewTile;
