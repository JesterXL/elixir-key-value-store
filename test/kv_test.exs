defmodule KVTest do
  use ExUnit.Case, async: true
  doctest KV

  test "the truth" do
    assert 1 + 1 == 2
  end

  setup do
  	{:ok, bucket} = KV.Bucket.start_link
  	{:ok, bucket: bucket}
  end

  test "stores values by key", %{bucket: bucket} do
  	assert KV.Bucket.get(bucket, "milk") == nil

  	KV.Bucket.put(bucket, "milk", 3)
  	assert KV.Bucket.get(bucket, "milk") == 3
  end

  test "stores a value then can delete it", %{bucket: bucket} do
	KV.Bucket.put(bucket, "milk", 3)
	assert KV.Bucket.get(bucket, "milk") == 3
  	KV.Bucket.delete(bucket, "milk")
  	assert KV.Bucket.get(bucket, "milk") == nil
  end
end
