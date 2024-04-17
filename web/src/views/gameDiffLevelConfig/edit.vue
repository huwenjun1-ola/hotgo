<template>
  <div>
    <n-spin :show="loading" description="请稍候...">
      <n-modal
        v-model:show="isShowModal"
        :show-icon="false"
        preset="dialog"
       :title="params?.levelId > 0 ? '编辑 #' + params?.levelId : '添加'"
        :style="{
          width: dialogWidth,
        }"
      >
        <n-form
          :model="params"
          :rules="rules"
          ref="formRef"
          label-placement="left"
          :label-width="100"
          class="py-4"
        >
          <n-form-item label="图片A的地址" path="imgA">
            <FileChooser v-model:value="params.imgA" file-type="image" />
          </n-form-item>

          <n-form-item label="图片B的地址" path="imgB">
            <FileChooser v-model:value="params.imgB" file-type="image" />
          </n-form-item>

          <n-form-item label="图片主题" path="type">
          <n-input placeholder="请输入图片主题类型" v-model:value="params.type" />
          </n-form-item>

          <n-form-item label="答案矩形坐标点" path="answerRects">
          <n-input style="height: 200px" placeholder="请输入answer_rects" v-model:value="params.answerRects" />
          </n-form-item>

          <n-form-item label="左右" path="dir">
          <n-switch placeholder="请输入0 左右 1 上下" v-model:value="params.dir" :unchecked-value="1" :checked-value="0"/>
          </n-form-item>

          <n-form-item label="描述" path="desc">
            <n-input placeholder="用于信息备注，不会被导出" v-model:value="params.desc" />
          </n-form-item>
        </n-form>
        <template #action>
          <n-space>
            <n-button @click="closeForm">取消</n-button>
            <n-button type="info" :loading="formBtnLoading" @click="confirmForm">确定</n-button>
          </n-space>
        </template>
      </n-modal>
    </n-spin>
  </div>
</template>

<script lang="ts" setup>
  import { onMounted, ref, computed, watch } from 'vue';
  import { Edit, View } from '@/api/gameDiffLevelConfig';
  import { rules, options, State, newState } from './model';
  import { useMessage } from 'naive-ui';
  import { adaModalWidth } from '@/utils/hotgo';
  import FileChooser from "@/components/FileChooser/index.vue";

  const emit = defineEmits(['reloadTable', 'updateShowModal']);

  interface Props {
    showModal: boolean;
    formParams?: State;
  }

  const props = withDefaults(defineProps<Props>(), {
    showModal: false,
    formParams: () => {
      return newState(null);
    },
  });

  const isShowModal = computed({
    get: () => {
      return props.showModal;
    },
    set: (value) => {
      emit('updateShowModal', value);
    },
  });

  const loading = ref(false);
  const params = ref<State>(props.formParams);
  const message = useMessage();
  const formRef = ref<any>({});
  const dialogWidth = ref('75%');
  const formBtnLoading = ref(false);

  function confirmForm(e) {
    e.preventDefault();
    formBtnLoading.value = true;
    formRef.value.validate((errors) => {
      if (!errors) {
        Edit(params.value).then((_res) => {
          message.success('操作成功');
          setTimeout(() => {
            isShowModal.value = false;
            emit('reloadTable');
          });
        });
      } else {
        message.error('请填写完整信息');
      }
      formBtnLoading.value = false;
    });
  }

  onMounted(async () => {
    adaModalWidth(dialogWidth);
  });

  function closeForm() {
    isShowModal.value = false;
  }

  function loadForm(value) {
    // 新增
    if (value.levelId < 1) {
      params.value = newState(value);
      loading.value = false;
      return;
    }

    loading.value = true;
    // 编辑
    View({ levelId: value.levelId })
      .then((res) => {
        params.value = res;
      })
      .finally(() => {
        loading.value = false;
      });
  }

  watch(
    () => props.formParams,
    (value) => {
      console.log(value)
      loadForm(value);
    }
  );
</script>

<style lang="less"></style>
