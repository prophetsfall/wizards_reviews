import React, { Component } from 'react';




class WizardsForm extends Component {
  constructor(props){
    super(props);
    this.state= {
      name: "",
      description: "",
      imageUrl: "",
      creator_id: null
    }
    this.onNameChange = this.onNameChange.bind(this)
    this.onDescriptionChange = this.onDescriptionChange.bind(this)
    this.onImageUrlChange = this.onImageUrlChange.bind(this)
    this.submitForm = this.submitForm.bind(this)
    this.onSubmitClick = this.onSubmitClick.bind(this)
  }
  onNameChange(event){
    event.preventDefault()
    this.setState({ name: event.target.value})
  }
  onDescriptionChange(event) {
    this.setState({ description: event.target.value})
  }
  onImageUrlChange(event) {
    this.setState({ imageUrl: event.target.value})
  }
  onSubmitClick(event) {
    event.preventDefault()
    let formPayLoad = {
      name: this.state.name,
      description: this.state.description,
      imageUrl: this.state.imageUrl,
      creator_id: this.state.creator_id
    }
    this.submitForm(formPayLoad)


  }
  submitForm(formPayLoad) {
    fetch("/api/vi/wizards", {
      method: 'POST',
      body: JSON.stringify(formPayLoad)
    })
    .then(response => {
      if (response.ok) {
        return response;
      } else {
        let errorMessage = `${response.status} (${response.statusText})`
        error = new Error(errorMessage);
        throw(error)
      }
    })
    .then(response => {
      let body = response.json()
      return body
    })
    .then(body => {
      this.setState({ name: body.name, description: body.description, imageUrl: body.imageUrl})
    })
    .catch(error => console.error(`Error in Fetch: ${error.message}`));
  }
  render() {
    return(
      <div>
        <form>
          <label htmlFor="name">Name</label>
          <input onChange={this.onNameChange} type="text" id="name" value={this.state.name}/>
          <label htmlFor="description">Description</label>
          <textarea onChange={this.onDescriptionChange} id='description' value={this.state.description}/>
          <label htmlFor="imageUrl">Image URL</label>
          <input onChange={this.onImageUrlChange} htmlFor="imageUrl" id="imageUrl" value={this.state.imageUrl}/>
          <input onClick={this.onSubmitClick} type="submit" value="Add New Wizard"/>
        </form>
      </div>
    )
  }

}
export default WizardsForm
