---
layout: post
title: Retool and DynamoDB
permalink: "/retool-and-dynamodb"
date: '2022-09-10'
tags:
- low-code
- no-sql
- DynamoDB
- retool
---

If you're trying to set up a DynamoDB query in [Retool](https://retool.com/) and you get the error `"One or more parameter values were invalid: Condition parameter type does not match schema type"` then is probably because you are using the syntax:

    { ":kind": {"S": "timesheet" } }

in your expression attribute value, it seems underneath that Retool use the "DocumentClient" interface, that will infer the type of the value, so you specify your value like:

    { ":kind": "timesheet" }

After getting that going then I discovered the visual parameter editor did not have a way to specify `ScanIndexForward` which I needed to to set to false to get the descending order sort I needed by date. There is a workaround for this, but you have to then use the JSON editor (which confusingly is selected by a checkbox that will stay on but then be labelled "Use visual parameter editor"). In my earlier debugging I had recreated my query in the AWS cli, so I was able to sue this with the `--debug` flag to dig the appropriate JSON out of the log (grep for "Making request for OperationModel" in stderr). I did have to translate back the expression attribute value as above however.

I can't wait for Retool to have an easily accessible local SQL database for simple jobs like what I am working on.

So I can find it later a full query in JSON format might look like:

    {
      "TableName": "<tablename>",
      "IndexName": "<indexname>",
      "ScanIndexForward": false,
      "KeyConditionExpression": "kind = :kind",
      "ExpressionAttributeValues": {
        ":kind":"timesheet"
      }
    }

