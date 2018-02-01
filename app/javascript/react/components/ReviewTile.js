import React from 'react';



const ReviewTile = props => {
  let body = props.body
  let rating = props.rating
  let created_at = props.created_at
  let votes = props.votes
  let handleClick = (event) => {
    let clicked = event.currentTarget.id
    if ($(`#${clicked}`).hasClass('selected')) {
      $(`#${clicked}`).removeClass('selected')
    } else {
      $(`#${clicked}`).addClass('selected')
    }
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
      <div>
        <a id="downvote"  onClick={handleClick}>
          <i className="fas fa-arrow-down" ></i>
        </a> {votes} <a id="upvote" onClick={handleClick}>
          <i className="fas fa-arrow-up" ></i>
        </a>
      </div>
    </div>
  )
}
export default ReviewTile;
