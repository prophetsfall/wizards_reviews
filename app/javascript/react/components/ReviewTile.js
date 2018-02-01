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
          <span onClick={handleClick}>
            <i id="downvote" className="selected fas fa-arrow-down" ></i>
          </span> {votes} <span onClick={handleClick}>
            <i id="upvote" className="fas fa-arrow-up" ></i>
          </span>
        </div>
      )
    } else if (props.voted === 1) {
      return (
        <div>
          <span onClick={handleClick}>
            <i id="downvote" className="fas fa-arrow-down" ></i>
          </span> {votes} <span onClick={handleClick}>
            <i id="upvote" className="selected fas fa-arrow-up" ></i>
          </span>
        </div>
      )
    } else {
      return (
        <div>
          <span onClick={handleClick}>
            <i id="downvote" className="fas fa-arrow-down" ></i>
          </span> {votes} <span onClick={handleClick}>
            <i id="upvote" className="fas fa-arrow-up" ></i>
          </span>
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
    <div>
      <p> {body}</p>
      <p> {rating}</p>
      {upvoter()}
    </div>
  )
}
export default ReviewTile;
