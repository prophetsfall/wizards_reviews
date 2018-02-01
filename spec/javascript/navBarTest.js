import NavBar from '../../app/javascript/react/components/NavBar.js'
import BackButton from '../../app/javascript/react/components/BackButton.js'

import { shallow, mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';
import React from 'react';
import 'jasmine-ajax';

Object.assign(global, {
  jasmineEnzyme,
  mount,
  React,
  shallow,
});

let requireAll = requireContext => {
  requireContext.keys().forEach(requireContext);
};

describe('NavBar', () => {
  let wrapper
  beforeEach(() => {
    jasmineEnzyme();
    wrapper = mount(
      <NavBar />
    )
  });

  it('Should have a back button', () => {
    expect(wrapper.find(BackButton)).toBePresent();
  })
})
