# docker-detox

> Docker image for running detox test suite.

## Getting Started

This image comes set up with `detox`, `pyenv`, and multiple environments to run test suites against.

## Updating Docker Hub image

Build and tag the image:

```sh
$ docker build -t imagebuildinprocess .
$ docker tag imagebuildinprocess metagenscope/detox:latest
```

Push the image:

```sh
$ docker login
$ docker push metagenscope/detox:latest
```

Clean up:

```sh
$ docker rmi imagebuildinprocess metagenscope/detox:latest
```

## Contributing

Please read [`CONTRIBUTING.md`](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository][project-tags].

## Release History

See [`CHANGELOG.md`](CHANGELOG.md).

## Authors

* **Benjamin Chrobot** - _Initial work_ - [bchrobot](https://github.com/bchrobot)

See also the list of [contributors][contributors] who participated in this project.

## License

This project is licensed under the MIT License - see the [`LICENSE.md`](LICENSE.md) file for details.


[project-tags]: https://github.com/MetaGenScope/docker-detox/tags
[contributors]: https://github.com/MetaGenScope/docker-detox/contributors

