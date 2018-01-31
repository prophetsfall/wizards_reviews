import React from 'react';

const ReviewForm = (props) => {

  let handleBodyChange = (event) => {
    let value = event.target.value
    props.passDownReviewChange(value);
  }

  let handleRatingChange = (event) => {
    let value = event.target.value
    props.passDownRatingChange(value);
  }

  let handleSubmit = (event) => {
    event.preventDefault();
    props.passDownSubmit();
  }
  return(
    <div>
      <form id="form">

        <label id="label">Review Form
          <input
            type="text"
            name="reviewForm"
            id="reviewForm"
            value={props.bodyText}
            onChange={handleBodyChange}
          />
        </label>
        <div className="radio">
        <label>1
          <input name="rating" type="radio" value="20"
            checked={props.rating==='20'}
            onChange={handleRatingChange}
          />
        </label>
        <label>2
          <input name="rating" type="radio" value="40"
            checked={props.rating==='40'}
            onChange={handleRatingChange}
          />
        </label>
        <label>3
          <input name="rating" type="radio" value="60"
            checked={props.rating==='60'}
            onChange={handleRatingChange}
          />
        </label>
        <label>4
          <input name="rating" type="radio" value="80"
            checked={props.rating==='80'}
            onChange={handleRatingChange}
          />
        </label>
        <label>5
          <input name="rating" type="radio" value="100"
            checked={props.rating==='100'}
            onChange={handleRatingChange}
          />
        </label>
      </div>
      <input type="hidden" name='token' value={props.token}/>
        <div className="button-group">
          <button onClick={handleSubmit}>Submit Review</button>
        </div>
      </form>
    </div>
  )
}
export default ReviewForm;
