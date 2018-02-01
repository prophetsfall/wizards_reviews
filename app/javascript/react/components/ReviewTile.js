import React from 'react';



const ReviewTile = props => {
  let body = props.body
  let rating = props.rating
  let created_at = props.created_at
  let votes = props.votes
  let upvoter = () => {
    if (props.voted === -1) {
      return (
        <div>
          <i
            id="downvote"
            className="selected fas fa-arrow-down"
            onClick={handleClick}
          ></i>{votes}
          <i
            id="upvote"
            className="fas fa-arrow-up"
            onClick={handleClick}
          ></i>
        </div>
      )
    } else if (props.voted === 1) {
      return (
        <div>
          <i
            id="downvote"
            className="fas fa-arrow-down"
            onClick={handleClick}
          ></i> {votes}
          <i
            id="upvote"
            className="selected fas fa-arrow-up"
            onClick={handleClick}
          ></i>
        </div>
      )
    } else {
      return (
        <div>
          <i id="downvote"
            className="fas fa-arrow-down"
            onClick={handleClick}
          ></i> {votes}
          <i
            id="upvote"
            className="fas fa-arrow-up"
            onClick={handleClick}
          ></i>
        </div>
    )
    }
  }
  let handleClick = (event) => {
    let clicked = event.target.id
    let formPayload;
    if (clicked === 'upvote') {
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
    <div id='reviewscheck'>
      <p> {body}</p>
      <p> {rating}</p>
      {upvoter()}
    </div>
  )
}
export default ReviewTile;
