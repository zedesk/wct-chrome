# wct-chrome

Docker Chrome containers used to test Polymer project.

These containers could be used by CI pipelines, in Gitlab for example.

# Use

```
docker run -v $PWD:/app -w /app zedesk/wct-chrome npx xvfb-run polymer test -l chrome
```

or if you have configured chrome as headless into your wct.conf.json file

```
docker run -v $PWD:/app -w /app zedesk/wct-chrome npx polymer test -l chrome
```