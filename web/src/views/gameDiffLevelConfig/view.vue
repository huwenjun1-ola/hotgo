<template>
  <div>
    <div class="n-layout-page-header">
      <n-card :bordered="false" title="找茬关卡配置表详情"> <!-- CURD详情页--> </n-card>
    </div>
    <n-card :bordered="false" class="proCard mt-4" size="small" :segmented="{ content: true }">
      <n-descriptions label-placement="left" class="py-2" column="2">

        <n-descriptions-item>
          <template #label>关卡id</template>
          {{ formValue.levelId }}
        </n-descriptions-item>



        <n-descriptions-item>
          <template #label>图片主题类型</template>
          {{ formValue.type }}
        </n-descriptions-item>


        <n-descriptions-item>
          <template #label>布局</template>
          {{ formValue.layout }}
        </n-descriptions-item>


      </n-descriptions>
      <n-descriptions label-placement="left" class="py-2" column="1">

        <n-descriptions-item>
          <template #label>答案矩形坐标点</template>
          {{ formValue.answerRects }}
        </n-descriptions-item>

      </n-descriptions>
    </n-card>

    <n-card :bordered="false" class="proCard mt-4" size="small" :segmented="{ content: true }">
      <n-descriptions label-placement="top" title="内容" class="py-2" column="1">
        <n-descriptions-item>
          <template #label>图片A</template>
          <n-image style="margin-left: 10px; height: 100px; width: 100px" :src="formValue.imgA" />

        </n-descriptions-item>

        <n-descriptions-item>
          <template #label>图片B</template>
          <n-image style="margin-left: 10px; height: 100px; width: 100px" :src="formValue.imgB" />
        </n-descriptions-item>
      </n-descriptions>
    </n-card>
  </div>
</template>

<script lang="ts" setup>
  import { computed, onMounted, ref } from 'vue';
  import { useRouter } from 'vue-router';
  import { useMessage } from 'naive-ui';
  import { View } from '@/api/gameDiffLevelConfig';
  import { newState, options } from './model';
  import { getOptionLabel, getOptionTag } from '@/utils/hotgo';
  import { getFileExt } from '@/utils/urlUtils';

  const message = useMessage();
  const router = useRouter();
  const id = Number(router.currentRoute.value.params.id);
  const formValue = ref(newState(null));
  const fileAvatarCSS = computed(() => {
    return {
      '--n-merged-size': `var(--n-avatar-size-override, 80px)`,
      '--n-font-size': `18px`,
    };
  });

  //下载
  function download(url: string) {
    window.open(url);
  }

  onMounted(async () => {
    if (id < 1) {
      message.error('关卡id不正确，请检查！');
      return;
    }
    formValue.value = await View({ levelId: id });
  });
</script>

<style lang="less" scoped></style>
