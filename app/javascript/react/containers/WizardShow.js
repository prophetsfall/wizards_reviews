import React, { Component } from 'react';

import WizardTile from '../components/WizardTile';

class WizardShow extends Component {
  constructor(props) {
    super(props);
    this.state = {
      wizard: {
        name: "rincewind",
        description: "abject coward",
        imgUrl: "http://lorempixel.com/200/400/",
        rating: 20,
        creatorId: 4
      }
    }
  }

  // componentDidMount() {
  //   fetch(`/api/v1/wizards/${this.props.id}`)
  //   .then(response => {
  //     if (response.ok) {
  //       return response;
  //     } else {
  //       let errorMessage = `${response.status} (${response.statusText})`,
  //           error = new Error(errorMessage);
  //       throw(error);
  //     }
  //   })
  //   .then(response => response.json())
  //   .then(body => {
  //     this.setState({ wizard: body.wizard, reviews: body.reviews})
  //   })
  //   .catch(error => console.error(`Error in fetch: ${error.message}`));
  // }

  render() {
    return(
      <div>
        <WizardTile
          name={this.props.params.name}
        />
        {this.props.name}
      </div>
    )
  }
}

export default WizardShow;
